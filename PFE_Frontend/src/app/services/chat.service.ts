import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root', // ✅ This makes it globally available
})
export class ChatService {
  constructor(private http: HttpClient) {}

  sendMessage(message: string): Observable<any> {
    return this.http.post('http://127.0.0.1:5000/chat', { message });
  }
}
