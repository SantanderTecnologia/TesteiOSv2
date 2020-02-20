import { Component, OnInit, Input } from '@angular/core';
import { Statement } from 'src/app/model/statement.model';

@Component({
  selector: 'app-card',
  templateUrl: './card.component.html',
  styleUrls: ['./card.component.scss']
})
export class CardComponent implements OnInit {

  @Input()
  statement:Statement = {
    title: null,
    desc: null,
    date: null,
    value: null
};

  constructor() { }

  ngOnInit(): void {
  }

}
