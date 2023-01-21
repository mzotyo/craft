import * as rxjs from 'rxjs';
import { Observable, Observer, Subscriber, Updateable } from './observable';
import { createObservable as createBaseObservable } from './observable-adapter';

export function createObservable<T>(
  observable: rxjs.Observable<T>
): Observable<T> {
  console.debug(`[observable-adapter-rxjs]: createObservable()`);
  return new ObservableRsjxAdapter<T>(observable);
}

class ObservableRsjxAdapter<T> implements Observable<T> {
  private observable = createBaseObservable<T>();
  private subscription: rxjs.Subscription;

  constructor(rxjs: rxjs.Observable<T>) {
    console.debug(`[ObservableRsjxAdapter]: constructor()`);
    this.subscription = rxjs.subscribe((data: T) => this.update(data));
  }

  subscribe(observer: Observer<T>): Subscriber {
    console.debug(`[ObservableRsjxAdapter]: subscribe()`);
    return this.observable.subscribe(observer);
  }

  private update(data: T) {
    console.debug(`[ObservableRsjxAdapter]: update(${data})`);
    this.observable.getUpdateable().update(data);
  }
}
