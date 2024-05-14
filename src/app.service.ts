import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello Khalid! Welcome to the exciting world of Microservices and Devops.';
  }
}
