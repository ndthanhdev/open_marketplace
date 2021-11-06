import React from "react";

interface GridContext {
  columnCount: number;
  columnWidth: number;
  rowHeight: number;
}

const DefaultContextValue: GridContext = {
  columnCount: 1,
  columnWidth: 4,
  rowHeight: 8,
};

const GridContext = React.createContext<GridContext>(DefaultContextValue);

interface Grid {
  columnCount?: number;
}

const SuggestedColumnWidth = 16;

let Grid: React.FC<Grid> = ({ columnCount: columnCountProp, children }) => {
  const windowWidth = window.innerWidth;
  const [columnCount, columnWidth] = React.useMemo(() => {
    columnCountProp =
      columnCountProp ?? Math.floor(windowWidth / SuggestedColumnWidth);

    const columnWidth = Math.floor(windowWidth / columnCountProp);

    return [columnCountProp, columnWidth];
  }, [windowWidth, columnCountProp]);

  return (
    <GridContext.Provider
      value={{
        ...DefaultContextValue,
        columnCount,
        columnWidth,
      }}
    >
      {children}
    </GridContext.Provider>
  );
};

export { Grid, GridContext };
