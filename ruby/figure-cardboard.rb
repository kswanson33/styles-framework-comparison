# Theme colors & fonts
cardboard_fonts = {
  "base": "Noto Sans, StixGeneral",
}

cardboard_colors = {
  "black": "#000000",
  "white": "#FFFFFF",
  "gray1": "#757474",
}

# Feature code
def makeFigure(root: '.os-figure:not(.has-splash)')
  return <<~CSS
    /* figure-cardboard.rb */
    #{root} {
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
          font-family: #{cardboard_fonts['base']};
          font-size: 0.833rem;
          color: #{cardboard_colors["black"]};
        }
        > .os-caption {
          font-family: #{cardboard_fonts['base']};
          font-size: 0.833rem;
          color: #{cardboard_colors["gray1"]};
        }
      }
    }
  CSS
end

# Book code
book = ''
book = book + makeFigure() # book is a string
