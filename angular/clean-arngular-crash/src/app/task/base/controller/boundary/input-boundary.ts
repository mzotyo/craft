export interface HeaderControllerInputBoundary {
  toggleTaskAddEnabled(): void;
}

export interface TasksControllerInputBoundary {
  getTasks(): void;
  deleteTask(id: number): void;
  toggleReminder(id: number): void;
}
