create table cliente(
    id_cliente number(5) primary key,
    nome varchar(20) not null,
    sobrenome varchar(50) not null,
    obs varchar(250) not null,
    data_nasc date);
    
create table endereco(
    id_endereco number(5) primary key,
    tipo_logradouro varchar(10),
    logradouro varchar(50),
    bairro varchar(50),
    cidade varchar(50),
    uf varchar(50),
    id_cliente references cliente(id_cliente)
    );



set serveroutput on
declare
    cursor_saida SYS_REFCURSOR;
    v_id_cliente cliente.id_cliente%TYPE;
    v_nome cliente.nome%TYPE;
    v_sobrenome cliente.sobrenome%TYPE;
    v_obs cliente.obs%TYPE;
    v_data_nasc cliente.data_nasc%TYPE;
begin
    todos_cliente(cursor_saida);

    loop
        fetch cursor_saida into v_id_cliente,v_nome,v_sobrenome,v_obs,v_data_nasc;
        exit when cursor_saida%notfound;
        
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_id_cliente || 
                             ' Nome: ' || v_nome ||
                             ' Sobrenome: ' || v_sobrenome ||
                             ' Obs: ' || v_obs ||
                             ' Data Nasc:' || v_data_nasc);
        
        
    end loop;
    close cursor_saida;
    
end;