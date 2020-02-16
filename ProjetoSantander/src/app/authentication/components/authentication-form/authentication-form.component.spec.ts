import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AuthenticationFormComponent } from './authentication-form.component';
import { FormBuilder } from '@angular/forms';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { DataLogin } from 'src/app/model/login-data.model';

describe('AuthenticationFormComponent', () => {
  let component: AuthenticationFormComponent;
  let fixture: ComponentFixture<AuthenticationFormComponent>;
  const formBuilder: FormBuilder = new FormBuilder();

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule],
      declarations: [ AuthenticationFormComponent ],
      providers: [
        HttpClientTestingModule,
        { provide: FormBuilder, useValue: formBuilder }
      ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AuthenticationFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it(`deve ser um formulário válido`, () => {
    let username = component.loginForm.controls["username"];
    let password = component.loginForm.controls["password"];
    username.setValue("joao");
    password.setValue("Uj#132456");
    expect(component.loginForm.valid).toBeTruthy();
  });

  it(`deve ser um formulário inválido`, () => {
    let username = component.loginForm.controls["username"];
    let password = component.loginForm.controls["password"];
    username.setValue("joao");
    password.setValue("123");
    expect(component.loginForm.valid).toBeFalse();
  });

  it("deve testar a chamada do método de login", async(() => {
    let dataLogin:DataLogin = {
      user:"thiago",
      password:"Hf$13579"
    }
    spyOn(component, 'logIn').and.callThrough();
    component.logIn(dataLogin);
    expect( component.logIn).toHaveBeenCalled();
  }));

  it("deve testar a chamada do método de submitForm", async(() => {
    spyOn(component, 'submitForm').and.callThrough();
    component.submitForm();
    expect(component.submitForm).toHaveBeenCalled();
    expect(component.submitted).toEqual(true);
  }));
});
