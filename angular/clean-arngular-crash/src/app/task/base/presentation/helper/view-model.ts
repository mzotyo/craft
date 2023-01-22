import { TasksResponseModel } from '../../usecase/helper/response-model';

export type HeaderViewModel = {
  title: string;
  addTaskButton: {
    style: string[];
    label: string;
  };
};

export function mapTaskEnabledToViewModel(enabled: boolean): HeaderViewModel {
  return {
    title: 'Task Tracker',
    addTaskButton: {
      style: enabled ? ['btn', 'btn-red'] : ['btn', 'btn-green'],
      label: enabled ? 'Cacel' : 'Add',
    },
  };
}

export type TaskViewModel = {
  id: number;
  text: string;
  date: string;
  reminderStyle: string;
};

export type TasksViewModel = {
  tasks: TaskViewModel[];
};

export function mapTasksToViewModel(model: TasksResponseModel): TasksViewModel {
  return {
    tasks: model.tasks.map((task) => ({
      id: task.id,
      text: task.text,
      date: task.date,
      reminderStyle: task.reminder ? 'reminder' : '',
    })),
  };
}
