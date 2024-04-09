import * as csstree from 'css-tree';

// Theme properties
const cardboard_fonts = {
  base: 'Noto Sans, StixGeneral'
}

const cardboard_colors = {
  black: '#000000',
  gray1: '#757474'
}

// Source helpers
type Source = {
  file: string,
  line: number,
  column: number
}

const getCurrentLine = (): Source => {
  // code to get current ts source info
}

// Convert CSS string to AST with source mapping
const cssToAstWithSource = (css: string, source: Source) => {
  csstree.parse(css, {
    context: 'Rule',
    positions: true,
    filename: source.file,
    line: source.line,
    column: source.column
  })
}

// Figure feature
const makeFigure = (root = ".os-figure:not(.has-splash)") => {
  const source = getCurrentLine();
  const css = /* CSS */`
    ${root} {
      > figure {
        display: table;
        margin-left: auto;
        margin-right: auto;
      }
      > .os-caption-container {
        display: table;
        margin-left: auto;
        margin-right: auto;
        margin-bottom: 0.7rem;
        line-height: 1rem;
        > .os-title-label, > .os-number, > .os-title {
          font-family: ${cardboard_fonts['base']};
          font-size: 0.833rem;
          color: ${cardboard_colors["black"]};
        }
        > .os-caption {
          font-family: ${cardboard_fonts['base']};
          font-size: 0.833rem;
          color: ${cardboard_colors["gray1"]};
        }
      }
    }
  `
  return cssToAstWithSource(css, source);
}

// Book code

let book: any[] = []
book.push(makeFigure()); 
// todo: make book of type Stylesheet,
//       append Rules to book

const [css, map] = csstree.generate(book, {sourceMap: true});
// write css & map to file

