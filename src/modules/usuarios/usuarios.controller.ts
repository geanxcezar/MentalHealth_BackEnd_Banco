import { Body, Controller, Get, Post } from '@nestjs/common';
import { UsuariosService } from './usuarios.service';
import { UsuariosDTO } from './usuarios.dto';

@Controller('usuarios')
export class UsuariosController {
  constructor(private readonly usuariosService: UsuariosService) {}

  @Post()
  async create(@Body() data: UsuariosDTO){
    return this.usuariosService.creat(data);
  }
  
  @Get()
  findAll() {
    return this.usuariosService.findAll();
  }
}
