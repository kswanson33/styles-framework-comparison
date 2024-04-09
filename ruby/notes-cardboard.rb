# Theme colors & fonts
$cardboard_fonts = {
  "base": "Noto Sans, StixGeneral",
  "title": "Roboto Condensed, StixGeneral"
}

$cardboard_colors = {
  "black": "#000000",
  "white": "#FFFFFF",
  "gray1": "#757474",
  "blue1": "#24739E",
  "blue2": "#D3E3EB",
  "blue3": "#344456",
  "blue4": "#D6D9DD",
  "orange1": "#D34D32"
}

# Feature code
def makeNote_BoxedSubtitled(root:, colorIndex:)
  colorOptions = {
    "title-text":       [:white, :black  ].map { |v| $cardboard_colors[v] },
    "title-background": [:blue1, :orange1].map { |v| $cardboard_colors[v] },
    "body-background":  [:blue2, :blue4  ].map { |v| $cardboard_colors[v] },
    "subtitle-text":    [:blue3, :blue3  ].map { |v| $cardboard_colors[v] }
  }
  return <<~CSS
    /* Source: <filename> */
    #{root} {
      margin-bottom: 1.4rem;
      > .os-title {
        color: "#{colorOptions[:"title-text"][colorIndex]}";
        font-family: "#{$cardboard_fonts[:title]}";
        font-size: 1.2rem;
        line-height: 1.5rem;
        text-transform: uppercase;
        font-weight: normal;
        background-color: "#{colorOptions[:"title-background"][colorIndex]}";
        border-radius: 0.25rem 0.25rem 0 0;
        padding: 0.7rem;
      }
      > .os-note-body {
        font-family: "#{$cardboard_fonts[:base]}";
        font-size: 1rem;
        line-height: 1.5rem;
        background-color: "#{colorOptions[:"body-background"][colorIndex]}";
        padding: 0.7rem;
        > .os-subtitle {
          color: "#{colorOptions[:"subtitle-text"][colorIndex]}";
          font-family: "#{$cardboard_fonts[:title]}";
          font-size: 1.2rem;
          line-height: 1.5rem;
          font-weight: normal;
          margin-bottom: 0.7rem;
        }
        > [data-type=exercise] {
          > [data-type=problem], > [data-type=solution] {
            h4 {
              font-family: "#{$cardboard_fonts[:base]}";
              font-size: 1.2rem;
              font-weight: bold;
            }
          }
          > [data-type=problem] > .os-problem-container > ul:not([data-labeled-item=true]) {
            margin-left: 8px;
            padding-left: 16px;
          }
        }
      }
    }
  CSS
end

# Book code
book = ''
book = book + makeNote_BoxedSubtitled(root: '.real-world', colorIndex: 0)
book = book + makeNote_BoxedSubtitled(root: '.what-would', colorIndex: 1)
book = book + makeNote_BoxedSubtitled(root: '.ethics-across', colorIndex: 1)

File.open('./ruby/notes-cardboard.css', 'w') do |file|
  file.write(book)
end
