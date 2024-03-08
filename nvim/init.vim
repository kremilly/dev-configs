" Define a localização da pasta de plugins
call plug#begin('~/.config/nvim/plugged')

" Instalação dos plugins
" NERDTree para navegação de arquivos
Plug 'preservim/nerdtree'

" vim-airline para uma barra de status estilizada
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Integração com o servidor de linguagem coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" fzf.vim para busca rápida de arquivos e buffers
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" vim-commentary para comentar e descomentar rapidamente
Plug 'tpope/vim-commentary'

" vim-surround para manipulação de pares de delimitadores
Plug 'tpope/vim-surround'

" vim-gitgutter para mostrar modificações do Git
Plug 'airblade/vim-gitgutter'

" ALE para linting e verificações de sintaxe
Plug 'dense-analysis/ale'

" vim-test para execução de testes automatizados
Plug 'vim-test/vim-test'

" vim-polyglot para suporte a várias linguagens
Plug 'sheerun/vim-polyglot'

" neoterm para usar o terminal
Plug 'kassio/neoterm'

" Exemplo de configuração básica do vim-quickrun
Plug 'thinca/vim-quickrun'

" Finaliza a lista de plugins
call plug#end()

" Configurações adicionais
set number relativenumber

" Configurações do NERDTree
" Ativar o NERDTree automaticamente ao iniciar o NeoVim
autocmd VimEnter * NERDTree
let g:NERDTreeShowDrives = 1

" Configurações do coc.nvim
" (Adicione suas configurações do coc.nvim aqui)

" Configurações do vim-airline
" (Adicione suas configurações do vim-airline aqui)

" Configurações do fzf.vim
" (Adicione suas configurações do fzf.vim aqui)

" Configurações adicionais do seu init.vim
" (Adicione outras configurações personalizadas aqui)

" Atalho para abrir o terminal horizontalmente na parte inferior
nnoremap <F12> :below :Ttoggle<CR>
nnoremap <F3> :wincmd _<CR>

" Configurar um atalho de teclado para executar o código
nmap <F5> <Plug>(quickrun)