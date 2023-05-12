import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/database/PrismaService';
import { UsuariosDTO } from './usuarios.dto';

@Injectable()
export class UsuariosService {

    constructor(private prisma: PrismaService) { }

    //METODO PARA CRIAR UM USUARIO
    async create(data: UsuariosDTO) {
        let { email, senha } = data
        const usuarios = await this.prisma.usuarios.create({
            data: {
                email,
                senha
            }
        });

        return usuarios;
    }
    findAll() {
        return this.prisma.usuarios.findMany({
            orderBy: [{
                email: 'asc',
            }]

        })
    }

    //METODO PARA ALTERAR UM USUARIO COM PASSAGEM DE PARAMETRO
    async update(id: number, data: UsuariosDTO) {
        return this.prisma.usuarios.update({
                where: {
                     id: id 
                },
             data: data
            })
    }
    //METODO PARA DELETAR UM USUARIO
    async delete(id: number) {
        return await this.prisma.usuarios.delete({
            where: {
                id,
            },
        });
    }

}
