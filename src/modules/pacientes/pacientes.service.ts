import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/database/PrismaService';
import { PacientesDTO } from './pacientes.dto';

@Injectable()
export class PacientesService {

    constructor(private prisma: PrismaService) { }

    //METODO PARA CRIAR UM PACIENTES
    async create(data: PacientesDTO) {
        let { name, address, management,
            phone, sectionsWeek, avatarUrl,
            createdAt, bloqueado } = data
        const pacientes = await this.prisma.pacientes.create({
            data: {
                name,
                address,
                management,
                phone, 
                sectionsWeek, 
                avatarUrl,
                createdAt,
                bloqueado
            }
        });

        return pacientes;
    }
    findAll() {
        return this.prisma.pacientes.findMany({
            orderBy: [{
                name: 'asc',
            }]

        })
    }

    //METODO PARA ALTERAR UM PACIENTES COM PASSAGEM DE PARAMETRO
    async update(id: number, data: PacientesDTO) {
        return this.prisma.pacientes.update({
            where: {
                id: id
            },
            data: data
        })
    }
    //METODO PARA DELETAR UM PACIENTES
    async delete(id: number) {
        return await this.prisma.pacientes.delete({
            where: {
                id,
            },
        });
    }

}
