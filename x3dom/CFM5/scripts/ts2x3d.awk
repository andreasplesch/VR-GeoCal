$1 ~ "^name:" { split($1, tsname, ":") }
$1 ~ "VRTX" { coords[c++] = $3" "$4" "$5 }
$1 ~ "TRGL" { triangles[t++] = $2" "$3" "$4 }
END {
    print "<X3D>"
    print "  <Scene>"
    print "    <Shape DEF='"tsname[1]"'>"
    print "      <Appearance>"
    print "        <Material diffuseColor='0 0.5 0.5'></Material>"
    print "      </Appearance>"
    print "      <IndexedFaceSet solid='true' coordIndex='"
    for (t in triangles) {
        print triangles[t]" -1"
    }
    print "      '>"
    print "      <geoCoordinate point='"
    for (i=0; i<c; i++) {
        print coords[i]
    }
    print "' geoSystem='\"UTM\" \"Z11\" \"N\" \"CC\" \"easting_first\"'>"
    print "      </geoCoordinate>"
    print "      </IndexedFaceSet>"
    print "    </Shape>"
    print "  </Scene>"
    print "</X3D>"
}
    
}
