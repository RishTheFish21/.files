command: ""

refreshFrequency: 30000 # ms


# Add more or less <li> tags with <br> tags at constant intervals
# for a grid system at whatever size you want.

render: (output) ->
  """
  <div class="container">
    <ul class="buttons">
      <li class="button" id="sleep"><span>Sleep</span></span><img src='/system-control.widget/icons/sleep.png' /></li>
      <li class="button" id="restart"><span>Restart</span></span><img src='/system-control.widget/icons/restart.png' /></li>
      <li class="button" id="shutdown"><span>Shut Down</span></span><img src='/system-control.widget/icons/shut-down.png' /></li>

    </ul>
  </div>
  """

afterRender: (domEl) ->
  $(domEl).on 'click', '#sleep', => @run "pmset sleepnow"
  $(domEl).on 'click', '#restart', => @run "osascript -e 'tell app \"loginwindow\" to «event aevtrrst»'"
  $(domEl).on 'click', '#shutdown', => @run "osascript -e 'tell app \"loginwindow\" to «event aevtrsdn»'"


style: """

  padding: 0;
  margin: 0;

  .container {
    position: fixed;
    right: 5%;  //Adjust this to place grid wherever you want.
    bottom: 5%;
  }

  .buttons {
    padding: 0;
    margin: 0;
    width: auto;
  }

  .button:last-child {
    margin-bottom: 0;
  }

  .button {
    margin: 0px 0 4px 0;
    display: block;
    cursor: pointer;
    transform:scale(0.6, 0.6); // Adjust this to resize the grid.
    position: relative;
  }
  .button span{
    position: absolute;
    right: 100%;
    top: 0;
    width: auto;
    color: #333;
    font-size: 20px;
    background: rgba(255,255,255,0.7);
    margin-right: 10px;
    padding: 4px 15px;
    font-family: JetBrains Mono;
    border-radius: 4px;
    border: 1px solid #cdcdcd;
    line-height: 24px;
    display: none;
    white-space: nowrap;
  }

  .button:hover > span {
    display: block;
  }

"""
