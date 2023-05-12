import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { UsuariosService } from './usuarios.service';
import { UsuariosDTO } from './usuarios.dto';

@Controller('usuarios')
export class UsuariosController {
  constructor(private readonly usuariosService: UsuariosService) { }

  @Post()
  async create(@Body() data: UsuariosDTO) {
    return this.usuariosService.create(data);
  }

  @Get()
  findAll() {
    return this.usuariosService.findAll();
  }

  @Put(":id")
  async update(@Param('id') id: string, @Body() data: UsuariosDTO) {
    return this.usuariosService.update(+id, data);
  }

  @Delete(":id")
  async Delete(@Param('id') id: string) {
    return this.usuariosService.delete(+id);
  }

}
