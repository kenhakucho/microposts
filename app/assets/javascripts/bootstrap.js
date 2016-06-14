var shiftWindow = function() { setTimeout("scrollBy(0, -50)", 200) };
    window.addEventListener("hashchange", shiftWindow);
    function load() { if (window.location.hash) shiftWindow(); }