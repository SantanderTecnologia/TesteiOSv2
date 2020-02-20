import { FormatAccountNumberPipe } from './format-account-number.pipe';

describe('FormatAccountNumberPipe', () => {
  it('create an instance', () => {
    const pipe = new FormatAccountNumberPipe();
    expect(pipe).toBeTruthy();
  });

  it('deve retornar umm pipe válido para o valor fornecido', () => {
    const pipe = new FormatAccountNumberPipe();
    expect(pipe.transform("012314564")).toEqual("01.231456-4");
  });
  
});
