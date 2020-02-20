import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'lib-primary-button',
  templateUrl: './primary-button.component.html',
  styleUrls: ['./primary-button.component.css']
})
export class PrimaryButtonComponent implements OnInit {

  @Input() buttonText:string = "Texto Botão";

  constructor() { }

  ngOnInit(): void {
  }

}
