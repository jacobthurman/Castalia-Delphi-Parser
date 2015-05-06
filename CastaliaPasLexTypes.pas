{---------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License Version
1.1 (the "License"); you may not use this file except in compliance with the
License. You may obtain a copy of the License at
http://www.mozilla.org/NPL/NPL-1_1Final.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: mwPasLexTypes, released November 14, 1999.

The Initial Developer of the Original Code is Martin Waldenburg
unit CastaliaPasLexTypes;

----------------------------------------------------------------------------}

unit CastaliaPasLexTypes;

interface

uses SysUtils, TypInfo;

{$INCLUDE CastaliaParserDefines.inc}

var
  CompTable: array[#0..#255] of byte;

type

  TMessageEventType = ( meError, meNotSupported );

  TMessageEvent = procedure(Sender: TObject; const Typ : TMessageEventType; const Msg: string; X, Y: Integer ) of object; //jdj 7/16/1999; DR 2001-11-06

  TCommentState = (csAnsi, csBor, csNo);

  TTokenPoint = packed record
    X : Integer;
    Y : Integer;
  end;

  TptTokenKind = (
    ptAbort, //JThurman 2004-11-8 (flow control routines)
    ptAbsolute,
    ptAbstract,
    ptAdd,
    ptAddressOp,
    ptAmpersand,
    ptAnd,
    ptAnsiComment,
    ptAnsiString,
    ptArray,
    ptAs,
    ptAsciiChar,
    ptAsm,
    ptAssembler,
    ptAssign,
    ptAt,
    ptAutomated,
    ptBegin,
    ptBoolean,
    ptBorComment,
    ptBraceClose,
    ptBraceOpen,
    ptBreak, //JThurman 2004-11-8 (flow control routines)
    ptByte,
    ptByteBool,
    ptCardinal,
	ptCase,
    ptCdecl,
    ptChar,
    ptClass,
    ptClassForward,
    ptClassFunction,
    ptClassProcedure,
    ptColon,
    ptComma,
    ptComp,
    ptCompDirect,
    ptConst,
    ptConstructor,
	ptContains,
    ptContinue, //JThurman 2004-11-8 (flow control routines)
	ptCRLF,
	ptCRLFCo,
	ptCurrency,
	ptDefault,
	ptDefineDirect,
	ptDeprecated, // DR 2001-10-20
    ptDestructor,
    ptDispid,
    ptDispinterface,
    ptDiv,
    ptDo,
    ptDotDot,
    ptDouble,
    ptDoubleAddressOp,
    ptDownto,
    ptDWORD,
    ptDynamic,
    ptElse,
    ptElseDirect,
    ptEnd,
    ptEndIfDirect,
    ptEqual,
    ptError,
    ptExcept,
    ptExit, //JThurman 2004-11-8 (flow control routine)
    ptExport,
    ptExports,
    ptExtended,
    ptExternal,
    ptFar,
	ptFile,
  {$IFDEF D8_NEWER} //JThurman 2004-03-20
  ptFinal,
  {$ENDIF}
    ptFinalization,
    ptFinally,
    ptFloat,
    ptFor,
    ptForward,
    ptFunction,
    ptGoto,
    ptGreater,
    ptGreaterEqual,
  ptHalt, //JThurman 2004-11-8 (flow control routines)
  {$IFDEF D8_NEWER} //JThurman 2004-04-06
  ptHelper,
  {$ENDIF}
    ptIdentifier,
    ptIf,
    ptIfDirect,
    ptIfEndDirect,
    ptElseIfDirect,
    ptIfDefDirect,
    ptIfNDefDirect,
    ptIfOptDirect,
    ptImplementation,
    ptImplements,
    ptIn,
    ptIncludeDirect,
    ptIndex,
    ptInherited,
    ptInitialization,
    ptInline,
    ptInt64,
    ptInteger,
    ptIntegerConst,
    ptInterface,
    ptIs,
    ptLabel,
	ptLibrary,
	ptLocal,  // DR 2001-11-14
    ptLongBool,
    ptLongint,
    ptLongword,
    ptLower,
    ptLowerEqual,
    ptMessage,
    ptMinus,
    ptMod,
    ptName,
    ptNear,
    ptNil,
    ptNodefault,
    ptNone,
    ptNot,
    ptNotEqual,
    ptNull,
    ptObject,
    ptOf,
    ptOleVariant,
    ptOn,
  {$IFDEF D8_NEWER} //JThurman 2004-03-20
  ptOperator,
  {$ENDIF}
    ptOr,
    ptOut,
    ptOverload,
    ptOverride,
    ptPackage,
    ptPacked,
    ptPascal,
	ptPChar,
	ptPlatform, // DR 2001-10-20
    ptPlus,
    ptPoint,
    ptPointerSymbol,
    ptPrivate,
    ptProcedure,
    ptProgram,
    ptProperty,
    ptProtected,
    ptPublic,
    ptPublished,
    ptRaise,
    ptRead,
    ptReadonly,
    ptReal,
    ptReal48,
    ptRecord,
  {$IFDEF D12_NEWER}
    ptReference, //JThurman 2008-25-07 (anonymous methods)
  {$ENDIF}
    ptRegister,
    ptReintroduce,
    ptRemove,
    ptRepeat,
    ptRequires,
    ptResident,
    ptResourceDirect,
    ptResourcestring,
    ptRoundClose,
    ptRoundOpen,
    ptRunError, //JThurman 2004-11-8 (flow control routines)
    ptSafeCall,
  {$IFDEF D8_NEWER} //JThurman 2004-03-19
  ptSealed,
  {$ENDIF}
    ptSemiColon,
    ptSet,
	ptShl,
    ptShortint,
    ptShortString,
    ptShr,
    ptSingle,
    ptSlash,
    ptSlashesComment,
    ptSmallint,
    ptSpace,
    ptSquareClose,
    ptSquareOpen,
    ptStar,
  {$IFDEF D8_NEWER} //JThurman 2004-03-20
  ptStatic,
  {$ENDIF}
    ptStdcall,
    ptStored,
  {$IFDEF D8_NEWER}
  ptStrict, //JThurman 2004-03-03
  {$ENDIF}
    ptString,
	ptStringConst,
    ptStringDQConst,	// 2002-01-14	
    ptStringresource,
    ptSymbol,
    ptThen,
    ptThreadvar,
    ptTo,
    ptTry,
    ptType,
    ptUndefDirect,
    ptUnit,
    ptUnknown,
  {$IFDEF D8_NEWER} //JThurman 2004-03-2003
  ptUnsafe,
  {$ENDIF}
    ptUntil,
    ptUses,
	ptVar,
	ptVarargs, // DR 2001-11-14
    ptVariant,
    ptVirtual,
    ptWhile,
    ptWideChar,
    ptWideString,
    ptWith,
    ptWord,
    ptWordBool,
    ptWrite,
    ptWriteonly,
    ptXor);

TmwPasLexStatus = record
  CommentState: TCommentState;
  ExID: TptTokenKind;
  LineNumber: Integer;
  LinePos: Integer;
  Origin: PAnsiChar;
  RunPos: Integer;
  TokenPos: Integer;
  TokenID: TptTokenKind;
end;

const ExTypes = [ptDWORD, ptUnknown];

function TokenName(Value: TptTokenKind): string;
function ptTokenName(Value: TptTokenKind): string;
function IsTokenIDJunk(const aTokenID : TptTokenKind ) :Boolean; //XM 20001210

implementation

function TokenName(Value: TptTokenKind): string;
begin //jdj 7/18/1999
  Result := Copy(ptTokenName(Value), 3, MaxInt);
end;

function ptTokenName(Value: TptTokenKind): string;
begin
  result := GetEnumName(TypeInfo(TptTokenKind), Integer(Value));
end;

function IsTokenIDJunk(const aTokenID : TptTokenKind ) :boolean; //XM 20001210
begin
  Result := aTokenID in [ptAnsiComment, ptBorComment, ptCRLF, ptCRLFCo, ptSlashesComment, ptSpace,
    ptIfDirect,
    ptIfEndDirect,
    ptElseIfDirect,
    ptIfDefDirect,
    ptIfNDefDirect,
    ptEndIfDirect,
    ptIfOptDirect,
    ptDefineDirect,
    ptUndefDirect];
end;


end.

