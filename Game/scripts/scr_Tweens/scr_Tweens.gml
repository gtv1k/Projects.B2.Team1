function Tween_Linear(t) { return t;}

function Tween_QuadIn(t) { return t * t; }

function Tween_QuadOut(t) { return t * (2 - t); }

function Tween_QuadInOut(t) { return t < 0.5 ? 2 * t * t : -1 + (4 - 2 * t) * t; }

function Tween_CubicIn(t) { return t * t * t; }

function Tween_CubicOut(t) { return (t - 1) * t * t + 1; }

function Tween_CubicInOut(t) { return t < 0.5 ? 4 * t * t * t : (t - 1) * (2 * t - 2) * (2 * t - 2) + 1; }

function Tween_QuartIn(t) { return t * t * t * t; }

function Tween_QuartOut(t) { return 1 - (t - 1) * t * t * t; }

function Tween_QuartInOut(t) { return t < 0.5 ? 8 * t * t * t * t : 1 - 8 * (t - 1) * t * t * t; }

function Tween_QuintIn(t) { return t * t * t * t * t; }

function Tween_QuintOut(t) { return 1 + (t - 1) * t * t * t * t; }

function Tween_QuintInOut(t) { return t < 0.5 ? 16 * t * t * t * t * t : 1 + 16 * (t - 1) * t * t * t * t; }