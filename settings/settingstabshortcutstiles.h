#ifndef SETTINGSTABSHORTCUTSTILES_H
#define SETTINGSTABSHORTCUTSTILES_H

#include "../customelements/customcheckbox.h"
#include "../customelements/customlabel.h"

#include <QWidget>
#include <QLabel>
#include <QPushButton>
#include <QVBoxLayout>
#include <QTimer>
#include <QStyleOption>
#include <QPainter>

// This class provides tiles representing a shortcut
class ShortcutsTiles: public QWidget {

	Q_OBJECT

public:
	ShortcutsTiles(QString exeCmd, QString exeDesc, QString category, QString availORexist, QWidget *parent = 0);
	~ShortcutsTiles();

	// The main back label
	CustomLabel *back;

	// The cmd and the category
	QString exe;
	QString cat;

	// The stylesheet
	QString css;
	QString cssBackgroundNorm;
	QString cssBackgroundHov;

	// This button adds a new instance of it (displayed for available shortcuts, i.e. right side)
	QPushButton *add;

	// A checkbox for quitting PhotoQt after executing (displayed for existing shortcuts)>
	CustomCheckBox *quit;

	// Display a white "M" for mouse shortcuts
	QLabel *mouse;
	bool isMouseShortcut;

	// Delete this shortcut (displayed for existing shortcuts)>
	QPushButton *del;

	// This Button holds the shortcut and a click on it allows the user to renew it
	CustomLabel *shortcut;

	// This holds the current shortcut without any formatting
	QString shortcutText;

	// The id of the current tile
	QString id;

	// Two types possible: "avail" or "exist"
	QString type;

	// Turn tile into mouse shortcut
	void makeMouseShortcut(bool m);

public slots:
	// Add a new instance of this tile
	void addButClkd();
	// Remove its set shortcut
	void removeMe();
	// Renew its currently set shortcut
	void shButClkd();
	// Click on back of tile
	void backClicked();

protected:
	// Some protected events
	void enterEvent(QEvent *);
	void leaveEvent(QEvent *);
	void mouseDoubleClickEvent(QMouseEvent *);
	void paintEvent(QPaintEvent *);

signals:
	// A new shortcut is to be added
	void addShortcut(QString execute, QString category);
	// Remove this item
	void removeItem(QString id, QString cat);
	// Renew this shortcut
	void renewShortcut(QString cat, QString id, QString exe);
	// Change external command
	void changeCmd(QString cmd, QString identify);

};

#endif // SETTINGSTABSHORTCUTSTILES_H
