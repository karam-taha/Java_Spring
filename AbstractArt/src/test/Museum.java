package test;

import java.util.ArrayList;
import java.util.Collections;

public class Museum {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArrayList<Art> museum = new ArrayList<Art> ();
		Painting one = new Painting("Oil");
		Painting two = new Painting("Watercolor");
		Painting three = new Painting("Acrylic");
		Sculpture sone = new Sculpture("Marble");
		Sculpture stwo = new Sculpture("Bronze");
		one.viewArt();
		two.viewArt();
		three.viewArt();
		sone.viewArt();
		stwo.viewArt();
		museum.add(one);
		museum.add(two);
		museum.add(three);
		museum.add(sone);
		museum.add(stwo);
		Collections.shuffle(museum);
		for (Art piece : museum) {
			piece.viewArt();
		}
	}

}
