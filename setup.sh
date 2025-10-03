#!/bin/bash

# ==========================================
# SCRIPT DE INSTALAÇÃO - SISTEMA DE CONTROLE DE ESTOQUE
# ==========================================

echo "🚀 Bem-vindo ao Sistema de Controle de Estoque!"
echo "=================================================="

# Verificar se Node.js está instalado
if ! command -v node &> /dev/null; then
    echo "❌ Node.js não está instalado!"
    echo "Por favor, instale o Node.js 16+ antes de continuar."
    echo "Visite: https://nodejs.org/"
    exit 1
fi

# Verificar versão do Node.js
NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 16 ]; then
    echo "❌ Versão do Node.js muito antiga!"
    echo "Requer Node.js 16 ou superior."
    echo "Versão atual: $(node --version)"
    exit 1
fi

echo "✅ Node.js $(node --version) detectado"

# Verificar se npm está instalado
if ! command -v npm &> /dev/null; then
    echo "❌ npm não está instalado!"
    exit 1
fi

echo "✅ npm $(npm --version) detectado"

# Criar diretórios necessários
echo "📁 Criando estrutura de diretórios..."
mkdir -p backend/uploads backend/logs backend/temp
mkdir -p frontend/dist

# Copiar arquivo de ambiente exemplo se não existir
if [ ! -f ".env" ]; then
    echo "📄 Criando arquivo de configuração .env..."
    cp .env.example .env
    echo "⚠️  Por favor, edite o arquivo .env com suas configurações!"
else
    echo "✅ Arquivo .env já existe"
fi

# Instalar dependências do backend
echo "📦 Instalando dependências do backend..."
cd backend
npm install
if [ $? -ne 0 ]; then
    echo "❌ Erro ao instalar dependências do backend"
    exit 1
fi
echo "✅ Dependências do backend instaladas"

# Instalar dependências do frontend
echo "📦 Instalando dependências do frontend..."
cd ../frontend
npm install
if [ $? -ne 0 ]; then
    echo "❌ Erro ao instalar dependências do frontend"
    exit 1
fi
echo "✅ Dependências do frontend instaladas"

# Voltar para o diretório raiz
cd ..

# Criar scripts de inicialização
echo "🔧 Criando scripts de inicialização..."

# Script para desenvolvimento
cat > start-dev.sh << 'EOF'
#!/bin/bash
echo "🚀 Iniciando modo desenvolvimento..."
echo "Frontend: http://localhost:3000"
echo "Backend:  http://localhost:5000"
echo "API Docs: http://localhost:5000/api-docs"
echo ""
npm run dev
EOF

# Script para produção
cat > start-prod.sh << 'EOF'
#!/bin/bash
echo "🏭 Iniciando modo produção..."
echo "Aplicação: http://localhost:5000"
echo ""
npm run build
npm start
EOF

# Tornar scripts executáveis
chmod +x start-dev.sh start-prod.sh

# Criar arquivo de informações
cat > INFO.md << 'EOF'
# 🎉 Sistema de Controle de Estoque - Instalado!

## 📋 Próximos Passos

1. **Configurar variáveis de ambiente**
   - Edite o arquivo `.env` com suas configurações
   - Configure o MongoDB Atlas ou MongoDB local
   - Adicione sua chave OpenAI (opcional)

2. **Iniciar o sistema**
   ```bash
   # Modo desenvolvimento (frontend + backend)
   ./start-dev.sh
   
   # Ou manualmente
   npm run dev
   ```

3. **Primeiro Acesso**
   - Acesse: http://localhost:3000
   - Crie uma conta de administrador em /register
   - Configure o sistema conforme suas necessidades

## 📚 Documentação

- **README.md** - Documentação completa
- **templates/** - Arquivos de exemplo para importação
- **docs/** - Documentação técnica

## 🔧 Comandos Úteis

```bash
# Desenvolvimento
npm run dev              # Tudo
npm run dev:frontend     # Só frontend
npm run dev:backend      # Só backend

# Build
npm run build           # Build do frontend

# Produção
npm start              # Iniciar backend
```

## 📞 Suporte

Se encontrar problemas:
1. Verifique o arquivo `.env`
2. Confirme que o MongoDB está rodando
3. Verifique os logs em `backend/logs/`
4. Crie uma issue no GitHub

## 🎉 Sucesso!

Seu sistema de controle de estoque está instalado e pronto para uso!
EOF

echo ""
echo "🎉 INSTALAÇÃO CONCLUÍDA COM SUCESSO!"
echo "======================================"
echo ""
echo "✅ Todas as dependências foram instaladas"
echo "✅ Estrutura de diretórios criada"
echo "✅ Scripts de inicialização configurados"
echo ""
echo "📖 Próximos passos:"
echo "1. Configure o arquivo .env com suas credenciais"
echo "2. Execute: ./start-dev.sh para iniciar"
echo "3. Acesse: http://localhost:3000"
echo ""
echo "📋 Leia o arquivo INFO.md para mais detalhes"
echo ""
echo "Bom trabalho! 🚀"