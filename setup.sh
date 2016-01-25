#!/usr/bin/env bash

echo "Instalando as gems necessárias..."
bundle
echo
echo
echo

echo "Criando o banco de dados..."
rake db:create
echo
echo
echo

echo "Criando as tabelas através das migrações..."
rake db:migrate
echo
echo
echo

echo "Rodando os testes..."
rspec
echo
echo
echo

echo "Iniciando o servidor..."
rails s
