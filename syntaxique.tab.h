
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
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


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     idf = 258,
     chaine = 259,
     mc_float = 260,
     mc_int = 261,
     mc_text = 262,
     ce = 263,
     cr = 264,
     dp = 265,
     pt = 266,
     pvg = 267,
     vg = 268,
     mc_use = 269,
     bib_io = 270,
     bib_math = 271,
     mc_name = 272,
     mc_start = 273,
     mc_stop = 274,
     equal = 275,
     mc_say = 276,
     mc_step = 277,
     mc_by = 278,
     mc_until = 279,
     acc_fer = 280,
     acc_ouv = 281,
     not_equal = 282,
     equal_less = 283,
     equal_great = 284,
     less = 285,
     great = 286,
     signe_chaine = 287,
     signe_int = 288,
     signe_reel = 289,
     mc_hear = 290,
     Commentaire = 291,
     plus = 292,
     sub = 293,
     mul = 294,
     div2 = 295
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 13 "syntaxique.y"

    int entier;
    float reel;
    char* str;



/* Line 1676 of yacc.c  */
#line 100 "syntaxique.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


