/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ERRO = 258,
     id = 259,
     string = 260,
     num = 261,
     IMPRIME = 262,
     LER = 263,
     VARS = 264,
     INICIO = 265,
     FIM = 266,
     INT = 267,
     ATRIBUICAO = 268,
     SENAO = 269,
     ENQUANTO = 270,
     SE = 271,
     FOR = 272,
     DIF = 273,
     MOD = 274,
     MAIOROUIGUAL = 275,
     MENOROUIGUAL = 276,
     IGUAL = 277,
     E = 278,
     OU = 279,
     NOT = 280
   };
#endif
/* Tokens.  */
#define ERRO 258
#define id 259
#define string 260
#define num 261
#define IMPRIME 262
#define LER 263
#define VARS 264
#define INICIO 265
#define FIM 266
#define INT 267
#define ATRIBUICAO 268
#define SENAO 269
#define ENQUANTO 270
#define SE 271
#define FOR 272
#define DIF 273
#define MOD 274
#define MAIOROUIGUAL 275
#define MENOROUIGUAL 276
#define IGUAL 277
#define E 278
#define OU 279
#define NOT 280




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 25 "everest.y"
{
  int vari;
  char *vars;
}
/* Line 1529 of yacc.c.  */
#line 104 "y.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

