import { TestBed } from '@angular/core/testing';

import { SantanderLibService } from './santander-lib.service';

describe('SantanderLibService', () => {
  let service: SantanderLibService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SantanderLibService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
