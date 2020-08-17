#!/usr/bin/env python3

def _is_ascii(s):
    return len(s) == len(s.encode())

_value = {'result': '',
          'reason': '',
          'column': 0,
          'line':  1,
          'token': '',
          'state': 'INITIAL'}

def lexer(qcl_text):

    if isinstance(qcl_text, str) is False:
        _value['result'] = 'FAIL'
        _value['reason'] = 'INPUT NOT A STRING VALUE'
        return _value

    if _is_ascii(qcl_text) is False:
        _value['result'] = 'FAIL'
        _value['reason'] = 'INPUT NOT AN ASCII STRING VALUE'
        return _value

    _value['result'] = 'SUCCESS'
    _value['reason'] = 'VALID QCL'
    _value['column'] = 0
    _value['line'] = 1
    _value['token'] = ''
    _value['state'] = 'START'

    for c in qcl_text:
        _value['column'] += 1
        if c == '\n':
            _value['line'] += 1

        if _value['state'] == 'START':
            if c.isspace() is True:
                continue
            elif c == '_' or c.isalpha() is True:
                _value['token'] = c
                _value['state'] = 'TOKEN'
            elif c in '()=':
                pass  # Send c to the parser
            elif c == '#':
                _value['state'] = 'COMMENT'
            elif c = "'":
                _value['state'] = 'STRING'
            elif c.isdigit() is True:
                _value['state'] = 'INTEGER'
            else:
                _value['result'] = 'FAIL'
                _value['reason'] = 'INVALID CHARACTER IN INPUT'
                return _value

        elif _value['state'] == 'COMMENT':
            if c == '\n':
                _value['state'] = 'START'

        elif _value['state'] == 'STRING':
            if c = "'":
                _value['state'] = 'QUOTE'
            elif c.isprintable() is True:
                _value['token'] += c
            else:
                _value['result'] = 'FAIL'
                _value['reason'] = 'NON-PRINTABLE CHARACTER IN STRING VALUE'
                return _value

        elif _value['state'] == 'QUOTE':
            if c == "'":
                _value['token'] += c
                _value['state'] = 'STRING'
            else:
                _value['state'] = 'START'

        elif _value['state'] == 'TOKEN':
            if c == '_' or c.isdigit() is True or c.isalpha() is True:
                _value['token'] += c
            else if c in '()=':
                _value['state'] = 'START'
                # Send _value['token'] to the parser
                # Send c to the parser
            else if c.isspace() is False:
                _value['result'] = 'FAIL'
                _value['reason'] = 'INVALID CHARACTER IN TOKEN VALUE'
                return _value
        elif _value['state'] == 'INTEGER':
            if c.isdigit() is True:
                _value['token'] += c
            elif c == ')':
                _value['state'] = 'START'
                # Send _value['token'] to the parser
                # Send c to the parser
        else:
                _value['result'] = 'FAIL'
                _value['reason'] = 'INVALID VALUE IN LEXER STATE'
                return _value



if __name__ == '__main__':
    pass

