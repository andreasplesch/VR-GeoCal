$1 ~ "TRGL" {triangles[t++]=$2" "$3" "$4}
END {
    print "<X3D>"
    print "  <Scene>"
    print "    <Shape DEF="defname">"
    print "      <Appearance>"
    print "        <Material diffuseColor="0 0.5 0.5"></Material>
    print "      </Appearance>"
    print "      <IndexedFaceSet solid='true' coordIndex='"
    for (t in triangles) {
        print t" -1"
    }
}
