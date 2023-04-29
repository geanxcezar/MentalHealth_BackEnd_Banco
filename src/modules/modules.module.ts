import { Module } from '@nestjs/common';
import { ModulesService } from './modules.service';
import { ModulesController } from './modules.controller';
import { UsuariosModule } from './usuarios/usuarios.module';

@Module({
  controllers: [ModulesController],
  providers: [ModulesService],
  imports: [UsuariosModule]
})
export class ModulesModule {}
