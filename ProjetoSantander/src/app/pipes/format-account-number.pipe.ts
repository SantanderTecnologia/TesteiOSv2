import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'formatAccountNumber'
})
export class FormatAccountNumberPipe implements PipeTransform {

  transform(value:string): string {

    let data = value.split('');

    var newArray = "";

    data.map((d, index)=>{
      if(index == 1 || index == 7){
        if(index == 1){
          newArray = newArray + d + ".";
        }else{
          newArray = newArray + d + "-";
        }
      }else{
        newArray = newArray + d;
      }
      
    });

    return newArray;
  }

}
