import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { PsicologosService } from './psicologos.service';
import { PsicologosDTO } from './psicologos.dto';

@Controller('psicologos')
export class PsicologosController {
  constructor(private readonly psicologosService: PsicologosService) { }

  @Post()
  async create(@Body() data: PsicologosDTO) {
    return this.psicologosService.create(data);
  }

  @Get()
  findAll() {
    return this.psicologosService.findAll();
  }

  @Put(":id")
  async update(@Param('id') id: string, @Body() data: PsicologosDTO) {
    return this.psicologosService.update(+id, data);
  }

  @Delete(":id")
  async Delete(@Param('id') id: string) {
    return this.psicologosService.delete(+id);
  }

}
