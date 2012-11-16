function uniquefilename(prepend,ext)
{
  Return "#prepend#_#dateformat(now(),"mmddyy")#_#timeformat(now(),"HHmmss")#.#ext#";
}