/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    AND = 258,
    ASSIGN = 259,
    COLON = 260,
    DIV = 261,
    ELSE = 262,
    END = 263,
    EQ = 264,
    GE = 265,
    GLOBAL = 266,
    GT = 267,
    IF = 268,
    LEFT_PAREN = 269,
    LE = 270,
    LT = 271,
    MINUS = 272,
    MOD = 273,
    MULT = 274,
    NE = 275,
    NOT = 276,
    OR = 277,
    PLUS = 278,
    PRINT = 279,
    READ = 280,
    RIGHT_PAREN = 281,
    SEMICOLON = 282,
    WHILE = 283,
    COMMA = 284,
    DEF = 285,
    DOT = 286,
    EXITLOOP = 287,
    FLOAT = 288,
    FORMAT = 289,
    FORM = 290,
    FUN = 291,
    INT = 292,
    LEFT_SQ_BKT = 293,
    NUL = 294,
    PRODUCT = 295,
    RETURN = 296,
    RETURNS = 297,
    RIGHT_SQ_BKT = 298,
    SKIP = 299,
    STEP = 300,
    STRING = 301,
    TO = 302,
    ID = 303,
    INT_CONST = 304
  };
#endif
/* Tokens.  */
#define AND 258
#define ASSIGN 259
#define COLON 260
#define DIV 261
#define ELSE 262
#define END 263
#define EQ 264
#define GE 265
#define GLOBAL 266
#define GT 267
#define IF 268
#define LEFT_PAREN 269
#define LE 270
#define LT 271
#define MINUS 272
#define MOD 273
#define MULT 274
#define NE 275
#define NOT 276
#define OR 277
#define PLUS 278
#define PRINT 279
#define READ 280
#define RIGHT_PAREN 281
#define SEMICOLON 282
#define WHILE 283
#define COMMA 284
#define DEF 285
#define DOT 286
#define EXITLOOP 287
#define FLOAT 288
#define FORMAT 289
#define FORM 290
#define FUN 291
#define INT 292
#define LEFT_SQ_BKT 293
#define NUL 294
#define PRODUCT 295
#define RETURN 296
#define RETURNS 297
#define RIGHT_SQ_BKT 298
#define SKIP 299
#define STEP 300
#define STRING 301
#define TO 302
#define ID 303
#define INT_CONST 304

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 35 "prog.y"
 	
	char val[100];

#line 159 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
