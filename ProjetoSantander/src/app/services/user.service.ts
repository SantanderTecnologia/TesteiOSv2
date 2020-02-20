import { Injectable } from '@angular/core';
import { UserAccount } from '../model/user-account.model';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  userAccount:UserAccount = {
      userId: 1,
      name: "Jose da Silva Teste",
      bankAccount: "2050",
      agency: "012314564",
      balance: 3.3445
    };
  userAuthenticated:boolean = false;
  constructor() { }
}
