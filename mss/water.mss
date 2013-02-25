@water: #bdf;

#ocean_ne[zoom<6],
#ocean[zoom>=6],
#water[zoom>=6] {

  polygon-fill: @water;

  polygon-pattern-file: url('pattern/water.png');
  polygon-pattern-alignment: global;
  polygon-pattern-comp-op: soft-light;
  polygon-pattern-opacity: 0.3;

}
