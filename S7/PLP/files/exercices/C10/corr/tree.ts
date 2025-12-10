export type Prog = Stmt[]

export type Stmt
    = { type: 'Assignement', name: string, value: Expr }
    | { type: 'Sequence', first: Stmt, second: Stmt }
    | { type: 'If', condition: Expr, thenn: Stmt, elze?: Stmt }
    | { type: 'While', condition: Expr, body: Stmt }

export type Expr
    = { type: 'Boolean', value: boolean }
    | { type: 'Number', value: number }
    | { type: 'Identifier', name: string }
    | { type: 'Unary', operator: '-' | '!', operand: Expr }
    | {type: 'Binary', operator: '+' | '-' | '*', left: Expr, right: Expr  }