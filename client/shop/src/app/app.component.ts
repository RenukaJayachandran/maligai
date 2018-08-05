import { Component, OnInit } from '@angular/core';
import { Apollo } from 'apollo-angular';
import { map } from 'rxjs/operators';
import gql from 'graphql-tag';
import { Observable } from 'apollo-client/util/Observable';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'shop';
  courses: any;
  shops = [];

  constructor(
    private apollo: Apollo
  ) {}

  ngOnInit() {
    this.courses = this.apollo.watchQuery({
      query: gql`
      

{
  shop {
    name
    productsByshopId {
      name
      cost_price
    }
  }
}


      `
    })
      .valueChanges
      .pipe(
        map((result: any) => {
          return result.data.shop;
        })
      ).subscribe((x) => {
          this.shops = x;
      });
  }
}
