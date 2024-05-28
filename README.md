Task Manager Script

This Bash script serves as a simple task manager, allowing users to create, update, delete, and search tasks stored in a text file. Below is a breakdown of its functionalities and usage instructions.

Features:
Create Task: Users can add a new task with a title, description, location, and due date. Tasks are assigned unique identifiers and are marked as incomplete by default.

Update Task: Users can modify an existing task's title, description, location, and due date by providing its identifier.

Delete Task: Users can remove a task by specifying its identifier.

Show Task Information: Users can view details of a specific task by entering its identifier.

List Tasks by Day: Users can display tasks for a given date, categorized by completed and incomplete tasks.

Search Task by Title: Users can search for tasks based on their titles.

Usage:
Creating a Task:

Run the script with the command ./task_manager.sh create.
Follow the prompts to enter the task details.
Updating a Task:

Run the script with the command ./task_manager.sh update.
Enter the identifier of the task to update, followed by the new details.
Deleting a Task:

Run the script with the command ./task_manager.sh delete.
Enter the identifier of the task to delete.
Showing Task Information:

Run the script with the command ./task_manager.sh show.
Enter the identifier of the task to display its details.
Listing Tasks by Day:

Run the script with the command ./task_manager.sh list.
Enter the date (in the format YYYY-MM-DD) to view tasks for that day.
Searching Task by Title:

Run the script with the command ./task_manager.sh search.
Enter the title of the task to search for.
File Management:
The script uses a text file named tasks.txt to store task information.
Each task entry is formatted as: task_id|title|description|location|due_date|completed.
Error Handling:
The script includes error handling for missing required inputs and invalid task identifiers.
Notes:
Ensure the script file (task_manager.sh) has executable permissions.
Modify the script as needed to fit specific requirements or add additional features.
Back up the tasks.txt file regularly to prevent data loss.
