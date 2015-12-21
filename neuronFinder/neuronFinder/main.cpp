#include <iostream>
using namespace std;

#define SIZEX 10
#define SIZEY SIZEX
bool field[SIZEX][SIZEY];
int neuro[100][2];
int numberOfDots = 0;

void changeColor(int x, int y) {
	field[x][y] = !field[x][y];
}

void addToNeuro(int x, int y) {
	changeColor(x, y);
	neuro[numberOfDots][0] = x;
	neuro[numberOfDots][1] = y;
	numberOfDots++;

	for(int dx = -1; dx < 2; dx++)
		for(int dy = -1; dy < 2; dy++)
			if( ((x + dx) >= 0) && ((y + dy) >= 0) ) {
				if(field[x + dx][y + dy] != 0) {addToNeuro(x + dx, y + dy);}
			}
};

int main() {
	for(int i = 0; i < SIZEX; i++)
		for(int j = 0; j < SIZEY; j++)
			field[i][j] = 0;
	field[2][2] = 1;
	field[2][3] = 1;
	field[2][4] = 1;
	field[3][4] = 1;
	field[4][5] = 1;
	field[4][6] = 1;
	field[3][6] = 1;
	field[5][6] = 1;
	field[4][7] = 1;

	for(int x = 0; x < SIZEX; x++) {
		for(int y = 0; y < SIZEY; y++) {
			// x = SIZEX; y = SIZEY to break both cycles. Exception, "break, break" and goto seem to be not apropriate
			if(field[x][y] != 0) {addToNeuro(x, y); x = SIZEX; y = SIZEY;}	
		}
	}	

	// Print out the field
	cout << "  \t";
	for(int i = 0; i < SIZEX; i++)
		cout << i << " ";
	cout << "\n";

	for(int j = 0; j < SIZEY; j++) {
		cout << j << "\t";
		for(int i = 0; i < SIZEX; i++) {
			cout << field[i][j] << " ";
		}
		cout << "\n";
	}
	cout << "\n";

	for(int i = 0; i < numberOfDots; i++)
		cout << i + 1 << "(x = " << neuro[i][0] << ", y = " << neuro[i][1] << ")\n";
	system("pause");
	return 0;
}