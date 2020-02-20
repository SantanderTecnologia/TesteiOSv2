import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AuthenticationRoutingModule } from './authentication-routing.module';
import { AuthenticationComponent } from './authentication.component';
import { AuthenticationFormComponent } from './components/authentication-form/authentication-form.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { SantanderLibModule } from 'projects/santander-lib/src/public-api';

@NgModule({
  declarations: [AuthenticationComponent, AuthenticationFormComponent],
  imports: [
    CommonModule,
    AuthenticationRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    SantanderLibModule
  ],
  exports:[AuthenticationFormComponent]
})
export class AuthenticationModule { }
