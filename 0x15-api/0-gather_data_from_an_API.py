#!/usr/bin/python3
"""a Python script that, using this REST API, for a given employee ID,
returns information about his/her TODO list progress
"""
import requests
import sys


def get_employee_todo_progress(employee_id):
    # Define the base URL for the API
    base_url = 'https://jsonplaceholder.typicode.com'

    # Fetch employee information
    user_response = requests.get(f'{base_url}/users/{employee_id}')
    if user_response.status_code != 200:
        print("Error: Employee not found.")
        return
    employee = user_response.json()
    employee_name = employee.get('name')

    # Fetch employee's TODO list
    todos_response = requests.get(
            f'{base_url}/todos',
            params={'userId': employee_id}
            )
    if todos_response.status_code != 200:
        print("Error: Could not retrieve TODO list.")
        return
    todos = todos_response.json()

    # Calculate the number of completed and total tasks
    completed_tasks = [todo for todo in todos if todo.get('completed')]
    total_tasks = len(todos)
    number_of_done_tasks = len(completed_tasks)

    # Print the TODO list progress
    print(f"Employee {employee_name} is done with tasks(
            {number_of_done_tasks}/{total_tasks}
            ): ")
    for task in completed_tasks:
        print(f"\t {task.get('title')}")


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python script.py <employee_id>")
        sys.exit(1)

        try:
            employee_id = int(sys.argv[1])
        except ValueError:
            print("Error: Employee ID must be an integer.")
            sys.exit(1)

    get_employee_todo_progress(employee_id)
