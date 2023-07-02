-- Procedimentos Utilizadas
SELECT * FROM Designado;
USE hospital42;
DROP DATABASE hospital42;
CREATE DATABASE hospital42;

-- CreateTable
CREATE TABLE `Cirurgia` (
    `id_cirurgia` INTEGER NOT NULL AUTO_INCREMENT,
    `id_cirurgiao` INTEGER NOT NULL,
    `id_paciente` INTEGER NOT NULL,
    `id_sala` INTEGER NOT NULL,
    `tipo_cirurgia` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_cirurgia`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Sala` (
    `id_sala` INTEGER NOT NULL AUTO_INCREMENT,
    `equipamento` VARCHAR(191) NOT NULL,
    `numero_sala` INTEGER NOT NULL,

    PRIMARY KEY (`id_sala`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Cirurgiao` (
    `id_cirurgiao` INTEGER NOT NULL AUTO_INCREMENT,
    `id_medico` INTEGER NOT NULL,

    PRIMARY KEY (`id_cirurgiao`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Exame` (
    `id_exame` INTEGER NOT NULL AUTO_INCREMENT,
    `tipo` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_exame`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Receita` (
    `id_receita` INTEGER NOT NULL AUTO_INCREMENT,
    `medicamento` VARCHAR(191) NOT NULL,
    `quantidade` INTEGER NOT NULL,

    PRIMARY KEY (`id_receita`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Consulta` (
    `id_consulta` INTEGER NOT NULL AUTO_INCREMENT,
    `id_receita` INTEGER NOT NULL,
    `id_exame` INTEGER NOT NULL,
    `data_hora` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id_consulta`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Recepcao` (
    `id_recepcao` INTEGER NOT NULL AUTO_INCREMENT,
    `funcionamento` INTEGER NOT NULL,

    PRIMARY KEY (`id_recepcao`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Trabalha` (
    `id_trabalha` INTEGER NOT NULL AUTO_INCREMENT,
    `id_recepcionista` INTEGER NOT NULL,
    `id_recepcao` INTEGER NOT NULL,

    PRIMARY KEY (`id_trabalha`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Recepcionista` (
    `id_recepcionista` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(191) NOT NULL,
    `cpf` VARCHAR(191) NOT NULL,
    `horario_atendimento` INTEGER NOT NULL,

    PRIMARY KEY (`id_recepcionista`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Paciente` (
    `id_paciente` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(191) NOT NULL,
    `cpf` VARCHAR(191) NOT NULL,
    `tipo_sanguineo` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_paciente`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Quarto` (
    `id_quarto` INTEGER NOT NULL AUTO_INCREMENT,
    `id_enfermeiro` INTEGER NOT NULL,
    `id_paciente` INTEGER NOT NULL,
    `andar` INTEGER NOT NULL,

    PRIMARY KEY (`id_quarto`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Cti` (
    `id_cti` INTEGER NOT NULL AUTO_INCREMENT,
    `id_paciente` INTEGER NOT NULL,
    `id_enfermeiro` INTEGER NOT NULL,
    `tratamento` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_cti`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Designado` (
    `id_designado` INTEGER NOT NULL AUTO_INCREMENT,
    `id_enfermeiro` INTEGER NOT NULL,
    `id_quarto` INTEGER NOT NULL,

    PRIMARY KEY (`id_designado`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Medico` (
    `id_medico` INTEGER NOT NULL AUTO_INCREMENT,
    `id_recepcao` INTEGER NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `horario_atendimento` INTEGER NOT NULL,
    `crm` VARCHAR(191) NOT NULL,
    `cpf` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_medico`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Enfermeiro` (
    `id_enfermeiro` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(191) NOT NULL,
    `cpf` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_enfermeiro`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_ConsultaToRecepcao` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_ConsultaToRecepcao_AB_unique`(`A`, `B`),
    INDEX `_ConsultaToRecepcao_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_PacienteToRecepcao` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_PacienteToRecepcao_AB_unique`(`A`, `B`),
    INDEX `_PacienteToRecepcao_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_CtiToPaciente` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_CtiToPaciente_AB_unique`(`A`, `B`),
    INDEX `_CtiToPaciente_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Cirurgia` ADD CONSTRAINT `Cirurgia_id_cirurgiao_fkey` FOREIGN KEY (`id_cirurgiao`) REFERENCES `Cirurgiao`(`id_cirurgiao`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cirurgia` ADD CONSTRAINT `Cirurgia_id_paciente_fkey` FOREIGN KEY (`id_paciente`) REFERENCES `Paciente`(`id_paciente`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cirurgia` ADD CONSTRAINT `Cirurgia_id_sala_fkey` FOREIGN KEY (`id_sala`) REFERENCES `Sala`(`id_sala`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cirurgiao` ADD CONSTRAINT `Cirurgiao_id_medico_fkey` FOREIGN KEY (`id_medico`) REFERENCES `Medico`(`id_medico`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Consulta` ADD CONSTRAINT `Consulta_id_receita_fkey` FOREIGN KEY (`id_receita`) REFERENCES `Receita`(`id_receita`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Consulta` ADD CONSTRAINT `Consulta_id_exame_fkey` FOREIGN KEY (`id_exame`) REFERENCES `Exame`(`id_exame`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Trabalha` ADD CONSTRAINT `Trabalha_id_recepcionista_fkey` FOREIGN KEY (`id_recepcionista`) REFERENCES `Recepcionista`(`id_recepcionista`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Trabalha` ADD CONSTRAINT `Trabalha_id_recepcao_fkey` FOREIGN KEY (`id_recepcao`) REFERENCES `Recepcao`(`id_recepcao`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Quarto` ADD CONSTRAINT `Quarto_id_paciente_fkey` FOREIGN KEY (`id_paciente`) REFERENCES `Paciente`(`id_paciente`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cti` ADD CONSTRAINT `Cti_id_enfermeiro_fkey` FOREIGN KEY (`id_enfermeiro`) REFERENCES `Enfermeiro`(`id_enfermeiro`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Designado` ADD CONSTRAINT `Designado_id_quarto_fkey` FOREIGN KEY (`id_quarto`) REFERENCES `Quarto`(`id_quarto`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Designado` ADD CONSTRAINT `Designado_id_enfermeiro_fkey` FOREIGN KEY (`id_enfermeiro`) REFERENCES `Enfermeiro`(`id_enfermeiro`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Medico` ADD CONSTRAINT `Medico_id_recepcao_fkey` FOREIGN KEY (`id_recepcao`) REFERENCES `Recepcao`(`id_recepcao`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ConsultaToRecepcao` ADD CONSTRAINT `_ConsultaToRecepcao_A_fkey` FOREIGN KEY (`A`) REFERENCES `Consulta`(`id_consulta`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ConsultaToRecepcao` ADD CONSTRAINT `_ConsultaToRecepcao_B_fkey` FOREIGN KEY (`B`) REFERENCES `Recepcao`(`id_recepcao`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_PacienteToRecepcao` ADD CONSTRAINT `_PacienteToRecepcao_A_fkey` FOREIGN KEY (`A`) REFERENCES `Paciente`(`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_PacienteToRecepcao` ADD CONSTRAINT `_PacienteToRecepcao_B_fkey` FOREIGN KEY (`B`) REFERENCES `Recepcao`(`id_recepcao`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_CtiToPaciente` ADD CONSTRAINT `_CtiToPaciente_A_fkey` FOREIGN KEY (`A`) REFERENCES `Cti`(`id_cti`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_CtiToPaciente` ADD CONSTRAINT `_CtiToPaciente_B_fkey` FOREIGN KEY (`B`) REFERENCES `Paciente`(`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;
