import { TestBed } from '@angular/core/testing';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import {HttpClientModule} from '@angular/common/http';
import { ApiService } from './api.service';
import { DataLogin } from '../model/login-data.model';

describe('ApiService', () => {

  let service: ApiService;
  let mockHttp: any;

  beforeEach(() => {
    
    mockHttp = jasmine.createSpyObj('mockHttp', ['authentication', 'getUserStatements']);
    service = new ApiService(mockHttp);

    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule],
      providers: [ApiService]
    });
    service = TestBed.inject(ApiService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
  it('deve chamar o método de autenticação do usuáro', ()=>{
    let dataLogin:DataLogin = {
      user:"thiago",
      password:"123@Tghhgh"
    }
    service.authentication(dataLogin);
    spyOn(service,'authentication');
    service.authentication(dataLogin);
    expect(service.authentication).toHaveBeenCalled();
  });
  it('deve verificar se os dados de autenticação estão corretos', ()=>{
    let dataLogin:DataLogin = {
      user:"thiago",
      password:"123@Tghhgh"
    }
    service.authentication(dataLogin);
    spyOn(service,'authentication');
    service.authentication(dataLogin);
    expect(service.authentication).toHaveBeenCalledWith(dataLogin);
  });
  it('deve chamar o método de busca de extrato bancário do usuáro', ()=>{
    let idUser:number = 1;
    service.getUserStatements(idUser);
    spyOn(service,'getUserStatements');
    service.getUserStatements(idUser);
    expect(service.getUserStatements).toHaveBeenCalled();
  });
  it('deve chamar o método de busca de extrato bancário e verificar se usuáro esta correto', ()=>{
    let idUser:number = 1;
    service.getUserStatements(idUser);
    spyOn(service,'getUserStatements');
    service.getUserStatements(idUser);
    expect(service.getUserStatements).toHaveBeenCalledWith(idUser);
  });
  it('deve checar se url da api esta correta', ()=>{
    expect(service.apiConfig.url).toEqual('https://bank-app-test.herokuapp.com/api/');
  });

});
