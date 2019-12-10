% todos os Cpf's
cpf(123).
cpf(213).
cpf(321).
cpf(1234).

% Cpf's nao restritos
cpfNaoRestrito(123).
cpfNaoRestrito(213).
cpfNaoRestrito(321).

% Cpf's restritos
cpfRestrito(1234).

% todas as contas
conta(1).
conta(2).
conta(3).
conta(4).
conta(5).

% contas com limite
contaComLimite(2).
contaComLimite(4).
contaComLimite(5).

% contas sem limite
contaSemLimite(1).
contaSemLimite(3).

restrito(Cpf) :- cpfRestrito(Cpf), format('O Cpf (~w) está restrito', [Cpf]).
restrito(Cpf) :- cpf(Cpf), format('O Cpf (~w) não está restrito.', [Cpf]).

limite(Conta) :- contaSemLimite(Conta), format('\nA conta (~w) não tem limite disponível', [Conta]).
limite(Conta) :- contaComLimite(Conta), format('\nA conta (~w) tem limite disponível', [Conta]).

validarCompra(Cpf, Conta) :- cpfRestrito(Cpf), contaComLimite(Conta), restrito(Cpf), limite(Conta), format('\nCompra Inválida\n\n').
validarCompra(Cpf, Conta) :- cpfNaoRestrito(Cpf), contaSemLimite(Conta), restrito(Cpf), limite(Conta), format('\nCompra Inválida\n\n').
validarCompra(Cpf, Conta) :- cpfRestrito(Cpf), contaSemLimite(Conta), restrito(Cpf), limite(Conta), format('\nCompra Inválida\n\n').
validarCompra(Cpf, Conta) :- cpfNaoRestrito(Cpf), contaComLimite(Conta), restrito(Cpf), limite(Conta), format('\nCompra Válida\n\n').
