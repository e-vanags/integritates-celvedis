# Zinātnes integritātes ceļvedis

Integritātes pārkāpumu, apšaubāmu pētniecības prakšu un sistēmisko risku ceļvedis latviešu valodā. Daļa no iniciatīvas *Slow Science*.

Vietne: https://e-vanags.github.io/integritates-celvedis/

## Struktūra

- `index.qmd`: sākumlapa ar visu jēdzienu sarakstu un filtriem
- `taksonomija.qmd`: jēdzieni pēc pētniecības posmiem un statusa
- `glosarijs.qmd`: latviešu un angļu termini
- `par-celvedi.qmd`: mērķis, principi, gadījumu iekļaušanas noteikumi
- `jedzieni/`: katrs jēdziens atsevišķā failā
- `_template.qmd`: veidne jaunam jēdzienam
- `references.bib`: visas atsauces (BibTeX), stils `apa.csl`

## Jauna jēdziena pievienošana

1. Nokopē `_template.qmd` uz `jedzieni/jauns-jedziens.qmd`.
2. Aizpildi galveni: `title`, `subtitle` (angliski), `description`, `categories` (posms un statuss).
3. Atsauces pievieno failā `references.bib` un tekstā citē ar `[@atslega]`.
4. Pievieno jēdzienu sānjoslai failā `_quarto.yml` un tabulai failā `taksonomija.qmd`.

Statusa kategorijas: `Pārkāpums`, `Apšaubāma prakse`, `Sistēmisks risks`.

## Lokāla priekšskatīšana

```bash
quarto preview
```

## Publicēšana

Pēc katras izmaiņas `main` zarā GitHub Actions automātiski renderē vietni un publicē to `gh-pages` zarā. Repozitorija iestatījumos sadaļā Pages kā avots jāizvēlas zars `gh-pages`.

## Gadījumu princips

Ar vārdu tiek minēti tikai oficiāli konstatēti gadījumi: atsaukuma paziņojums, institūcijas, finansētāja vai tiesas lēmums.

## Licence

Saturs: CC BY 4.0.
