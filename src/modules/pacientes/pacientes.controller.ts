import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { PacientesService } from './pacientes.service';
import { PacientesDTO } from './pacientes.dto';

@Controller('pacientes')
export class PacientesController {
  constructor(private readonly PacientesService: PacientesService) { }

  @Post()
  async create(@Body() data: PacientesDTO) {
    return this.PacientesService.create(data);
  }

  @Get()
  findAll() {
    return this.PacientesService.findAll();
  }

  @Put(":id")
  async update(@Param('id') id: string, @Body() data: PacientesDTO) {
    return this.PacientesService.update(+id, data);
  }

  @Delete(":id")
  async Delete(@Param('id') id: string) {
    return this.PacientesService.delete(+id);
  }

}
