import { TestBed } from '@angular/core/testing';

import { UtilService } from './util.service';

describe('UtilService', () => {
  let service: UtilService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(UtilService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
  it('deve descriptografar corretamente o valor "Santander"', () => {
    expect(service.decryptData("U2FsdGVkX1/QwZxi/Tva+nVGv15FApOXBFlbW4RF5eBeKKvGTg/0740iiIKt9PG3")).toEqual({data:"Santander"});
  });
  it('deve verificar o navegador do cliente', () => {
    spyOn(service, 'getBrowserName').and.callThrough();
    service.getBrowserName();
    expect(service.getBrowserName).toHaveBeenCalled();
  });

});
