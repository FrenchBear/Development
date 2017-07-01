// 08_Hilbert.cpp
// Hilbert curve using SDL
// 2016-06-25	PV

#include <SDL.h>
#include <stdio.h>
#include <time.h>
#include <string>
#include <cmath>

//Screen dimension constants
const int SCREEN_WIDTH = 1280;
const int SCREEN_HEIGHT = 1080;

//Starts up SDL and creates window
bool init();

//Frees media and shuts down SDL
void close();

//The window we'll be rendering to
SDL_Window* gWindow = NULL;

//The window renderer
SDL_Renderer* gRenderer = NULL;

bool init()
{
	//Initialization flag
	bool success = true;

	//Initialize SDL
	if (SDL_Init(SDL_INIT_VIDEO) < 0)
	{
		printf("SDL could not initialize! SDL Error: %s\n", SDL_GetError());
		success = false;
	}
	else
	{
		//Set texture filtering to linear
		if (!SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, "1"))
		{
			printf("Warning: Linear texture filtering not enabled!");
		}

		//Create window
		gWindow = SDL_CreateWindow("SDL Tutorial", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN);
		if (gWindow == NULL)
		{
			printf("Window could not be created! SDL Error: %s\n", SDL_GetError());
			success = false;
		}
		else
		{
			//Create renderer for window
			gRenderer = SDL_CreateRenderer(gWindow, -1, SDL_RENDERER_ACCELERATED);
			if (gRenderer == NULL)
			{
				printf("Renderer could not be created! SDL Error: %s\n", SDL_GetError());
				success = false;
			}
			else
			{
				//Initialize renderer color
				SDL_SetRenderDrawColor(gRenderer, 0xFF, 0xFF, 0xFF, 0xFF);
			}
		}
	}

	return success;
}

void close()
{
	//Destroy window	
	SDL_DestroyRenderer(gRenderer);
	SDL_DestroyWindow(gWindow);
	gWindow = NULL;
	gRenderer = NULL;

	//Quit SDL subsystems
	SDL_Quit();
}


// --------------------------------------------------------------
// Hilbert

int cx, cy;		// Current coordinates
int a;			// Current angle
int mod;		// Size of elemental side

void dr(char *s) {
	for (char c; (c = *s++); ) {
		if (c == '-')
			a = (a + 1) % 4;
		else if (c == '+')
			a = (a + 3) % 4;
		else if (c == 'F') {
			int nx = 0, ny = 0;
			switch (a) {
			case 0:	nx = cx + mod; ny = cy; break;
			case 1:	nx = cx; ny = cy - mod; break;
			case 2:	nx = cx - mod; ny = cy; break;
			case 3:	nx = cx; ny = cy + mod; break;
			}
			SDL_RenderDrawLine(gRenderer, cx, cy, nx, ny);
			cx = nx;
			cy = ny;
		}
	}
}

void ls2(int level, char *rule) {
	if (level == 0)
		dr(rule);
	else
		for (char c; (c = *rule++); ) {
			if (c == 'X')
				ls2(level - 1, "-YF+XFX+FY-");
			else if (c == 'Y')
				ls2(level - 1, "+XF-YFY-FX+");
			else {
				char sb[2];
				sb[0] = c;
				sb[1] = 0;
				dr(sb);
			}
		}
}


// Main drawing function
// Hilbert curve of depth level
void draw(int level) {
	int side = (int)(pow(2.0, (double)level) - 1);	// Total number of elemental elements on the side
	mod = (int)((SCREEN_HEIGHT - 20) / (side + 1));			// Size of one side

															// Initial coordinates
	cx = (SCREEN_WIDTH - mod*side) / 2;
	cy = SCREEN_HEIGHT - (SCREEN_HEIGHT - mod*(side)) / 2;
	a = 0;											// Initial angle

	//Clear screen
	SDL_SetRenderDrawColor(gRenderer, 0xFF, 0xFF, 0xFF, 0xFF);
	SDL_RenderClear(gRenderer);
	SDL_SetRenderDrawColor(gRenderer, 0x00, 0x80, 0x00, 0xFF);		// Green
	
	ls2(level, "X");

	//Update screen
	SDL_RenderPresent(gRenderer);
}

// --------------------------------------------------------------


int main(int argc, char** argv)
{
	//Start up SDL and create window
	if (!init())
	{
		printf("Failed to initialize!\n");
	}
	else
	{
		bool quit = false;

		int level = 6;
		if (argc == 2)
			level = atoi(argv[1]);
		if (level<1 || level>10) level = 6;

		struct timespec tstart, tend;
		timespec_get(&tstart, TIME_UTC);
		draw(level);
		timespec_get(&tend, TIME_UTC);

		long ms = (tend.tv_sec - tstart.tv_sec) * 1000L + (tend.tv_nsec - tstart.tv_nsec) / 1000000L;
		printf("Level: %d, Duration: %ld ms\n", level, ms);

		//Event handler
		SDL_Event e;

		//While application is running
		while (!quit)
		{
			//Handle events on queue
			while (SDL_PollEvent(&e) != 0)
			{
				//User requests quit
				if (e.type == SDL_QUIT)
				{
					quit = true;
				}
			}
		}
	}

	//Free resources and close SDL
	close();

	return 0;
}