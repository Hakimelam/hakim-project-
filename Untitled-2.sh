#!/bin/bash

display_error_and_exit() {
    echo "$1" >&2
    exit 1
}

create_task() {
    read -p "Titre de la tâche (requis): " title
    if [ -z "$title" ]; then
        display_error_and_exit "Le titre de la tâche est requis."
    fi
    read -p "Description de la tâche: " description
    read -p "Lieu de la tâche: " location
    read -p "Date limite (YYYY-MM-DD HH:MM): " due_date
    if [ -z "$due_date" ]; then
        display_error_and_exit "La date limite de la tâche est requise."
    fi
    task_id=$(date +%s)
    completed=false
    echo "$task_id|$title|$description|$location|$due_date|$completed" >> tasks.txt
    echo "Tâche créée avec succès avec l'identifiant $task_id."
}

update_task() {
    read -p "Entrez l'identifiant de la tâche à mettre à jour: " task_id
    if ! grep -q "^$task_id|" tasks.txt; then
        display_error_and_exit "Aucune tâche trouvée avec cet identifiant."
    fi
    read -p "Nouveau titre de la tâche: " new_title
    read -p "Nouvelle description de la tâche: " new_description
    read -p "Nouveau lieu de la tâche: " new_location
    read -p "Nouvelle date limite (YYYY-MM-DD HH:MM): " new_due_date
    sed -i "/^$task_id|/s/|[^|]|[^|]|[^|]|[^|]|/|$new_title|$new_description|$new_location|$new_due_date|/" tasks.txt
    echo "Tâche mise à jour avec succès."
}

delete_task() {
    read -p "Entrez l'identifiant de la tâche à supprimer: " task_id
    if ! grep -q "^$task_id|" tasks.txt; then
        display_error_and_exit "Aucune tâche trouvée avec cet identifiant."
    fi
    sed -i "/^$task_id|/d" tasks.txt
    echo "Tâche supprimée avec succès."
}

show_task_info() {
    read -p "Entrez l'identifiant de la tâche: " task_id
    if ! grep -q "^$task_id|" tasks.txt; then
        display_error_and_exit "Aucune tâche trouvée avec cet identifiant."
    fi
    grep "^$task_id|" tasks.txt
}

list_tasks_by_day() {
    read -p "Entrez la date (YYYY-MM-DD) pour afficher les tâches: " target_date
    echo "Tâches terminées pour le $target_date :"
    grep "|$target_date" tasks.txt | grep "|true" | sed 's/|[^|]*$//'
    echo "Tâches non terminées pour le $target_date :"
    grep "|$target_date" tasks.txt | grep "|false" | sed 's/|[^|]*$//'
}

search_task_by_title() {
    read -p "Entrez le titre de la tâche à rechercher: " search_title
    echo "Tâches correspondantes pour le titre '$search_title' :"
    grep "|$search_title|" tasks.txt
}

touch tasks.txt

case "$1" in
    "create")
        create_task
        ;;
    "update")
        update_task
        ;;
    "delete")
        delete_task
        ;;
    "show")
        show_task_info
        ;;
    "list")
        list_tasks_by_day
        ;;
    "search")
        search_task_by_title
        ;;
    *)
        list_tasks_by_day
        ;;
esac