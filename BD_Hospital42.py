import mysql.connector

# ----------------------------------------------------------------
#              Estabelece a conexão com o banco de dados
# ----------------------------------------------------------------
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    database="hospital42"
)

# ----------------------------------------------------------------
#               DEF DE INSERÇÃO
# ----------------------------------------------------------------
def create_record_cirurgia(cursor):
    id_cirurgiao = int(input('Digite o id do cirurgiao: '))
    id_paciente = int(input('Digite o id do paciente: '))
    id_sala = int(input('Digite o id da sala: '))
    tipo_cirurgia = str(input('Digite o tipo da cirurgia: '))
    sql = "INSERT INTO Cirurgia (id_cirurgiao, id_paciente, id_sala, tipo_cirurgia) VALUES (%s,%s,%s,%s)"
    values = (id_cirurgiao, id_paciente, id_sala, tipo_cirurgia)
    cursor.execute(sql, values)
    connection.commit()
    print("Registro criado com sucesso!")

def create_record_cirurgiao(cursor):
    id_medico = int(input('Digite o id do(a) Medico(a): '))
    sql = "INSERT INTO Cirurgiao (id_medico) VALUES (%s)"
    values = (id_medico,)
    cursor.execute(sql, values)
    connection.commit()
    print("Registro criado com sucesso!")

def create_record_consulta(cursor):
    id_receita = int(input('Digite o id da receita: '))
    id_exame = int(input('Digite o id do exame: '))
    data_hora = str(input('Digite a data e hora da consulta(YYYY-MM-DD HH:MM:SS): '))
    sql = "INSERT INTO Consulta (id_receita, id_exame, data_hora) VALUES (%s,%s,%s)"
    values = (id_receita,id_exame,data_hora)
    cursor.execute(sql, values)
    connection.commit()
    print("Registro criado com sucesso!")

def create_record_cti(cursor):
    id_paciente = int(input('Digite o id do paciente: '))
    id_enfermeiro = int(input('Digite o id do enfermeiro: '))
    tratamento = str(input('Digite o tratamento realizado: '))
    sql = "INSERT INTO Cti (id_paciente, id_enfermeiro, tratamento) VALUES (%s, %s, %s)"
    values = (id_paciente,id_enfermeiro,tratamento)
    cursor.execute(sql, values)
    connection.commit()
    print("Registro criado com sucesso!")

def create_record_designado(cursor):
    id_enfermeiro = int(input('Digite o id do enfermeiro: '))
    id_quarto = int(input('Digite o id do quarto: '))
    sql = "INSERT INTO Designado (id_enfermeiro, id_quarto) VALUES (%s, %s)"
    values = (id_enfermeiro, id_quarto)
    cursor.execute(sql, values)
    connection.commit()
    print("Registro criado com sucesso!")

def create_record_enfermeiro(cursor):
    nome_enfermeiro = str(input('Digite o nome da(o) enfermeira(o): ')).capitalize()
    cpf_enfermeiro = str(input('Digite o CPF do enfermeiro: '))
    sql = "INSERT INTO Enfermeiro (nome,cpf) VALUES (%s, %s)"
    values = (nome_enfermeiro, cpf_enfermeiro)
    cursor.execute(sql, values)
    connection.commit()
    print("Registro criado com sucesso!")

def create_record_exame(cursor):
    tipo_exame = str(input('Digite qual o exame: '))
    sql = "INSERT INTO Exame (tipo) VALUES (%s)"
    values = (tipo_exame,)
    cursor.execute(sql, values)
    connection.commit()
    print("Registro criado com sucesso!")

def create_record_medico(cursor):
    id_recepcao = int(input('Digite o id da recepção: '))
    nome_medico = str(input('Digite o nome da(o) medica(o): '))
    horario_atendimento = str(input('Digite data e hora do atendimento: '))
    crm = str(input('Digite o CRM: '))
    cpf_medico = str(input('Digite o CPF: '))
    sql = "INSERT INTO Medico (id_recepcao, nome, horario_atendimento, crm, cpf) VALUES (%s, %s, %s, %s, %s)"
    values = (id_recepcao, nome_medico, horario_atendimento, crm, cpf_medico)
    cursor.execute(sql, values)
    connection.commit()
    print("Registro criado com sucesso!")

def create_record_paciente(cursor):
    nome_paciente = str(input('Digite o nome da(o) Paciente: '))
    cpf_paciente = str(input('Digite o CPF da(o) Paciente: '))
    tipo_sanguineo =  str(input('Digite o Tipo Sanguineo da(o) Paciente: '))
    sql = "INSERT INTO Paciente (nome, cpf, tipo_sanguineo) VALUES (%s, %s, %s)"
    values = (nome_paciente,cpf_paciente,tipo_sanguineo)
    cursor.execute(sql, values)
    connection.commit()
    print("Registro criado com sucesso!")

def create_record_quarto(cursor):
    id_enfermeiro = int(input('Digite o id do enfermeiro: '))
    id_paciente = int(input('Digite o id do paciente: '))
    andar = int(input('Digite o andar do quarto: '))
    sql = "INSERT INTO Quarto (id_enfermeiro, id_paciente, andar) VALUES (%s, %s, %s)"
    values = (id_enfermeiro,id_paciente,andar)
    cursor.execute(sql, values)
    connection.commit()
    print("Registro criado com sucesso!")
    
def create_record_receita(cursor):
    medicamento = str(input('Digite o Medicameto: '))
    quantidade = int(input('Digite a quantidade: '))
    sql = "INSERT INTO Receita (medicamento, quantidade) VALUES (%s, %s)"
    values = (medicamento,quantidade)
    cursor.execute(sql, values)
    connection.commit()
    print("Registro criado com sucesso!")

def create_record_recepcao(cursor):
    funcionamento = int(input('Digite o tempo de funcionamento: '))
    sql = "INSERT INTO Recepcao (funcionamento) VALUES (%s)"
    values = (funcionamento,)
    cursor.execute(sql, values)
    connection.commit()
    print("Registro criado com sucesso!")

def create_record_recepcionista(cursor):
    nome_recepcionista = str(input('Digite o nome da(o) Recepcionista: '))
    cpf_recepcionista = str(input('Digite o CPF da(o) Recepcionista: '))
    horario_atendimento = int(input('Digite o tempo de atendimeto: '))
    sql = "INSERT INTO Recepcionista (nome, cpf, horario_atendimento) VALUES (%s, %s, %s)"
    values = (nome_recepcionista, cpf_recepcionista, horario_atendimento)
    cursor.execute(sql, values)
    connection.commit()
    print("Registro criado com sucesso!")

def create_record_sala(cursor):
    equipamento = str(input('Digite o equipamento utilizado: '))
    numero_sala = int(input('Digite o numero da sala: '))
    sql = "INSERT INTO Sala (equipamento, numero_sala) VALUES (%s, %s)"
    values = (equipamento, numero_sala)
    cursor.execute(sql, values)
    connection.commit()
    print("Registro criado com sucesso!")

def create_record_trabalha(cursor):
    id_recepcionista = int(input('Digite o id do(a) Recepcionista: '))
    id_recepcao = int(input('Digite o id da Recepcao: '))
    sql = "INSERT INTO Trabalha (id_recepcionista,id_recepcao) VALUES (%s, %s)"
    values = (id_recepcionista,id_recepcao)
    cursor.execute(sql, values)
    connection.commit()
    print("Registro criado com sucesso!")



# ----------------------------------------------------------------
#               CONSULTA
# ----------------------------------------------------------------
def read_records(cursor):
    tabela = str(input('Digite o nome da Tabela: ')).capitalize()
    sql = f"SELECT * FROM {tabela}"
    cursor.execute(sql)
    colunas = [column[0] for column in cursor.description]
    # Imprime os nomes das colunas
    print(colunas)
    results = cursor.fetchall()
    for row in results:
        print(row)

# ----------------------------------------------------------------
#               PRINTA TABELA
# ----------------------------------------------------------------
def show_records(cursor,tabela):
    sql = f"SELECT * FROM {tabela}"
    cursor.execute(sql)
    colunas = [column[0] for column in cursor.description]
    # Imprime os nomes das colunas
    print(colunas)
    results = cursor.fetchall()
    for row in results:
        print(row)

# ----------------------------------------------------------------
#               UPDATE
# ----------------------------------------------------------------
def update_record(cursor):
    tabela = str(input('Digite o nome da tabela: ')).capitalize()
    show_records(cursor,tabela)
    id = str(input('Digite o id da linha que deseja alterar: '))
    mudanca = str(input('Digite a coluna que deseja mudar: '))
    valor = str(input('Digite o valor: '))
    sql = f"UPDATE {tabela} SET {mudanca} = %s WHERE id_{tabela.lower()} = %s"
    values = (valor, id)
    cursor.execute(sql, values)
    connection.commit()
    print("Registro atualizado com sucesso!")

# ----------------------------------------------------------------
#               DELETE
# ----------------------------------------------------------------
def delete_record(cursor):
    tabela = str(input('Digite o nome da tabela: ')).capitalize()
    show_records(cursor,tabela)
    id = int(input('Digite o id da linha que deseja deletar: '))
    sql = f"DELETE FROM {tabela} WHERE id_{tabela.lower()} = %s"
    value = (id,)
    cursor.execute(sql,value)
    connection.commit()
    print("Registro deletado com sucesso!")

# ----------------------------------------------------------------
#               EXECUÇÃO
# ----------------------------------------------------------------

# Criar um cursor
cursor = connection.cursor()

# dicionario para opções
opcoes_create = {
    '1': create_record_cirurgia,
    '2': create_record_cirurgiao,
    '3': create_record_consulta,
    '4': create_record_cti,
    '5': create_record_designado,
    '6': create_record_enfermeiro,
    '7': create_record_exame,
    '8': create_record_medico,
    '9': create_record_paciente,
    '10': create_record_quarto,
    '11': create_record_receita,
    '12': create_record_recepcionista,
    '13': create_record_recepcao,
    '14': create_record_sala,
    '15': create_record_trabalha
}

while True:
    escolha_acao = str(input("\nEscolha o que deseja fazer:\
                    \n1) Inserção\
                    \n2) Consulta\
                    \n3) Atualização\
                    \n4) Deletar\
                    \nOpção escolhida: "))
    
    if escolha_acao == '1':
        escolha_create = str(input("\nEscolha a tabela que deseja utilizar:\
                        \n1) Cirurgia\
                        \n2) Cirurgiao\
                        \n3) Consulta\
                        \n4) Cti\
                        \n5) Designado\
                        \n6) Enfermeiro\
                        \n7) Exame\
                        \n8) Medico\
                        \n9) Paciente\
                        \n10) Quarto\
                        \n11) Receita\
                        \n12) Recepcionista\
                        \n13) Recepcao\
                        \n14) Sala\
                        \n15) Trabalha\
                        \nOpção escolhida: "))
        
        try:
            opcoes_create[escolha_create](cursor)
        except KeyError:
            print('Opção Inválida')
            continue

    elif escolha_acao == '2':
        read_records(cursor)

    elif escolha_acao == '3':
        update_record(cursor)

    elif escolha_acao == '4':
        delete_record(cursor)

    else:
        print('\nOpção inválida')
        continue

    continuar = str(input('Deseja continuar? (S/N): ')).capitalize()
    if continuar == 'N':
        print('\nObrigado por utilizar o DB do Hospital42!')
        break

# Fechar o cursor e a conexão com o banco de dados
cursor.close()
connection.close()