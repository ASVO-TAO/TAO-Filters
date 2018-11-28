[![Build Status](https://travis-ci.com/manodeep/TAO-Filters.svg?branch=master)](https://travis-ci.com/manodeep/TAO-Filters)

WARNING
=======

**DO NOT USE UNTIL TESTS PASS. SOME FILTERS HAVE NON-COMPLIANT DATA**


TAO-Filters
===========

This repo contains the definitive list of filters, and filter transmissions
used within TAO. 

Tests
------

- Only files with extensions ``*.dat`` or ``*.dati`` are checked
- The first line of the file contains the number of lines (only one column)
- The second line of the file onwards contain two columns, first for wavelength
  and the second for transmission
- Transmission values (second column) must be in the closed interval [0.0, 1.0]

Maintainers
------------

- Manodeep Sinha 
- Ray Seikel
